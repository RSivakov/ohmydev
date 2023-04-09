#!/bin/sh
# Created by Roman Sivakov <romansivakov@gmail.com> for project OhMyDev
#
#
# set -x
## parameters
defaults() {
## send content of this directory to tablets
SYNC_FROM=/opt/aeroplanshet/ru_RU/
## save data from tablets in this directory
SYNC_TO_DIR=/opt/aeroplanshet/logs/
RSYNC_GETTER_MODULE=ru
RSYNC_SENDER_MODULE=logs
RSYNC_BIN=/usr/bin/rsync
RSYNC_OPT='--quiet --no-motd --recursive --compress --perms --owner --group --times --port 873 --delete --timeout=60 --contimeout=20 --partial'

## Can be: to/from/all
SYNC_TYPE=all

HOSTNAME=`hostname`
#
## logging parameters
## none or 0, error or 1, warning or 2, info or 3, debug or 4 or anything except previouse
LOGLEVEL='info'
LOG_FILE='/dev/logging'
}
#
## internat parameters
PROG_NAME="$0"
PID=$$
LOCK_FILE=/tmp/sync_planshet.lock
## end parameters

## functions
# logging
log() {
    local loglvl=$1
    local msg="$2"
    case $LOGLEVEL in
        none|0)
            LOGLEVEL=0
            LOG_FILE=/dev/null
        ;;
        error|1) LOGLEVEL=1;;
        warning|2) LOGLEVEL=2;;
        info|3) LOGLEVEL=3;;
        debug|4) LOGLEVEL=4;;
        *) echo "ERROR: Internal error" >> "$LOG_FILE" && terminate;;
    esac
    case $loglvl in
        error|1) loglvl=1;;
        warning|2) loglvl=2;;
        info|3) loglvl=3;;
        debug|4) loglvl=4;;
        *) echo "ERROR: Internal error" >> $LOG_FILE && terminate;;
    esac
    # if log level none do nothing
    if [[ $LOGLEVEL -eq 0 ]]; then
        return 0
    fi
    ## check log file
    if ! [[ -w $(dirname "$LOG_FILE") ]]; then
        echo "Can't write a log file \'$LOG_FILE\'"
        terminate
    fi

    if [[ $loglvl -le $LOGLEVEL ]]; then
        case $loglvl in
            1) echo "ERROR: $msg" >> "$LOG_FILE" && terminate;;
            2) echo "WARNING: $msg" >> "$LOG_FILE";;
            3) echo "INFO: $msg" >> "$LOG_FILE";;
            4) echo "DEBUG: $msg" >> "$LOG_FILE";;
            *) echo "ERROR: Internal error" >> "$LOG_FILE" && terminate;;
        esac
    fi
}
log_error() {
    log 1 "$1"
}
log_warning() {
    log 2 "$1"
}
log_info() {
    log 3 "$1"
}
log_debug() {
    log 4 "$1"
}

# syncing
sync_to() {
    local tablet_name=$1
    ## set lock in database
    if [[ x$GET_LIST_FROM_DB == "xyes" ]]; then
        local result=$(curl -f "http://$HOSTNAME/api/rsync/start_sync?name=${tablet_name}" 2>>/dev/null)
        log_debug "Set lock by curl: $result"
        log_debug "Curl command: curl -fs http://$HOSTNAME/api/rsync/start_sync?name=${tablet_name}"
        if [[ x"$result" == "xok" ]]; then
            log_info "Sending data to tablet $tablet_name..."
            log_debug "Rsync command: $RSYNC_BIN $RSYNC_OPT $SYNC_FROM/ $tablet_name::$RSYNC_GETTER_MODULE"
            $RSYNC_BIN $RSYNC_OPT $SYNC_FROM $tablet_name::$RSYNC_GETTER_MODULE 2>>"$LOG_FILE"
            local rc=$?
            sync_to_status $tablet_name $rc
        fi
    else
        log_info "Sending data to tablet $tablet_name..."
        log_debug "Rsync command: $RSYNC_BIN $RSYNC_OPT $SYNC_FROM/ $tablet_name::$RSYNC_GETTER_MODULE"
        $RSYNC_BIN $RSYNC_OPT $SYNC_FROM $tablet_name::$RSYNC_GETTER_MODULE 2>>"$LOG_FILE"
        sync_to_status $tablet_name $rc
    fi

}

sync_from() {
    local tablet_name=$1
    local log_dir=${SYNC_TO_DIR}/${tablet_name}/
    log_info "Get data from tablet $tablet_name..."
    log_debug "Local directory for getting data $log_dir."
    ## ensure directory exist
    mkdir -p $log_dir
    local rc=$?
    if [[ $rc -ne 0 ]]; then
        log_warning "Can't create a directory $log_dir for logs from tablet $tablet_name"
        return 1
    fi
    # create temporary dir
    local temp_dir=$(mktemp -d)
    log_info "Save data from tablet $tablet_name to temporary directory $temp_dir ..."
    log_debug "Create temporary directory: $temp_dir"
    ## get data from tablet and save it in temporary directory
    log_debug "Rsync command: $RSYNC_BIN $RSYNC_OPT $tablet_name::$RSYNC_SENDER_MODULE $temp_dir/"
    $RSYNC_BIN $RSYNC_OPT $tablet_name::$RSYNC_SENDER_MODULE "$temp_dir/" 2>>"$LOG_FILE"
    rc=$?
    if [[ $rc -ne 0 ]]; then
        # sync_failed $tablet_name
        log_warning "Problem with recieving data from tablet $tablet_name. Rsync exit code $rc"
        return 2
    else
        log_info "  ...done"
    fi
    ## move (by rsync) data to main directory for keeping data
    log_info "Move data from temporary directory $temp_dir to $log_dir..."
    log_debug "Rsync command: $RSYNC_BIN -a --remove-source-files $temp_dir/ $log_dir/"
    $RSYNC_BIN -a --remove-source-files "$temp_dir/" "$log_dir/" 2>>"$LOG_FILE"
    rc=$?
    if [[ $rc -ne 0 ]]; then
        log_warning "Didn't move logs from temporary directory $temp_dir to $log_dir. Rsync exit code $rc"
        return 2
    else
        log_info "  ...done"
    fi
    ## remove data from temporary directory
    # remove all (still not removed) content from temporary directory
    log_debug "Remove content from temporary directory $temp_dir"
    rm -fr ${temp_dir}/*
    ## send empyt temporary data to tablet for removing data on a tablet
    log_info "Clear data from tablet $tablet_name..."
    log_debug "Rsync command: $RSYNC_BIN $RSYNC_OPT $temp_dir/ $tablet_name::$RSYNC_SENDER_MODULE"
    $RSYNC_BIN $RSYNC_OPT "$temp_dir/" $tablet_name::$RSYNC_SENDER_MODULE 2>>"$LOG_FILE"
    rc=$?
    if [[ $rc -ne 0 ]]; then
        # sync_failed $tablet_name
        log_warning "Problem with clear data from tablet $tablet_name. Rsync exit code $rc"
        return 2
    else
        log_info "  ...done"
    fi
    ## remove temporary directory
    log_debug "Remove temporary directory $temp_dir"
    rm -fr "$temp_dir"
    log_info "...done"
}
sync_tablet() {
    local tablet_name=$1
    log_debug "Sync type is $SYNC_TYPE"
    case $SYNC_TYPE in
        to) sync_to $tablet_name;;
        from) sync_from $tablet_name;;
        *)
            sync_to $tablet_name
            sync_from $tablet_name;;
    esac
}
sync_to_status() {
    local tablet_name=$1
    local status=$2
    if [[ $status -ne 0 ]]; then
        log_warning "Fail synchronizing tablet $1"
    else
        log_info "...done"
    fi
    ## send status of sync
    if [[ x$GET_LIST_FROM_DB == "xyes" ]]; then
        log_debug "Send status of sync by curl: $status"
        log_debug "Curl command: curl -fs http://$HOSTNAME/api/rsync/end_sync?name=${tablet_name}&status=${rc}"
        curl -f "http://$HOSTNAME/api/rsync/end_sync?name=${tablet_name}&status=${rc}" 2>> /dev/null
    fi
}

terminate_by_trap() {
    log_warning "Exit by signal INT or TERM"
    terminate
}

terminate() {
    killall rsync 2>>"$LOG_FILE"
    rm -fr $LOCK_FILE 2>>"$LOG_FILE"
    exit 1
}

usage() {
    defaults
    cat << EOF
Usage: $PROG_NAME [options] [tablet_name [tablet_name] [...]]

"tablet_name" should be a dns name of tablet. If tablet_name not presents,
list of tablets will be getting from mysql database.

Options:
    --sync-from             Local folder or file, containing data to be sent to a tablet.
                            Default: $SYNC_FROM

    --sync-to               Local folder for the data to be received from the tablets.
                            Received data will be organized in directories <sync-to>/<tablet_name>
                            Default: $SYNC_TO_DIR

    --rsync-getter-module   Name of rsync module declared in rsyncd config file
                            (rsyncd.conf) on every tablet. This module should describe
                            what data should recieve and where is save on tablet.
                            Default: $RSYNC_GETTER_MODULE

    --rsync-sender-module   Name of rsync module declared in rsyncd config file
                            (rsyncd.conf) on every tablet. This module should describe
                            what data tablet should send to server.
                            Default: $RSYNC_SENDER_MODULE

    -l, --logfile           Filename for loggin of work this script.
                            Default: $LOG_FILE

    -v, --loglevel          Verbosity of logging. Can be: none or 0, error or 1,
                            warning or 2, info or 3, debug or 4
                            Default: $LOGLEVEL

    -q, --quiet             Send all logs to /dev/null

    -t, --sync-type         What content should be synchronized.
                            Can be:
                                to -- only send data to tablet(s)
                                from -- only recieve data from tablet(s)
                                all -- synchronize both to and from
                            Default: $SYNC_TYPE

    -h, --help              this help
EOF

}
## end function


## set defaults parameters
defaults

## trap signals
trap 'terminate_by_trap' INT TERM

## getopts
# Execute getopt
ARGS=$(getopt -o l:v:t:qh -l "sync-from:,sync-to:,rsync-getter-module:,rsync-sender-module:,logfile:,loglevel:,sync-type:,quiet,help" -n "$PROG_NAME" -- "$@");
getopt_rc=$?
log_debug "ARGS: $ARGS"
if [[ $getopt_rc -ne 0 ]]; then
    echo "Wrong command line parameter!" && usage && terminate
fi

eval set -- "$ARGS";


while true; do
  case "$1" in
    --sync-from)
       SYNC_FROM=$2
       shift 2
    ;;
    --sync-to)
       SYNC_TO_DIR=$2
       shift 2
    ;;
    --rsync-getter-module)
       RSYNC_GETTER_MODULE=$2
       shift 2
    ;;
    --rsync-sender-module)
       RSYNC_SENDER_MODULE=$2
       shift 2
    ;;
    -l|--logfile)
        LOG_FILE=$2
        shift 2
    ;;
    -v|--loglevel)
        LOGLEVEL=$2
        shift 2
    ;;
    -t|--sync-type)
        SYNC_TYPE=$2
        shift 2
      ;;
    -q|--quiet)
        # LOG_FILE=/dev/null
        LOGLEVEL=0
        shift
    ;;
    -h|--help)
        usage && exit 0
    ;;
    --)
      shift;
      break;
      ;;
    *) echo "Wrong parameter" && usage && terminate;;
  esac
done

## debug parameters
log_debug "Parameter SYNC_FROM: $SYNC_FROM"
log_debug "Parameter SYNC_TO_DIR: $SYNC_TO_DIR"
log_debug "Parameter RSYNC_GETTER_MODULE: $RSYNC_GETTER_MODULE"
log_debug "Parameter RSYNC_SENDER_MODULE: $RSYNC_SENDER_MODULE"
log_debug "Parameter RSYNC_SENDER_MODULE: $RSYNC_SENDER_MODULE"
log_debug "Parameter SYNC_TYPE: $SYNC_TYPE"
log_debug "Parameter LOGLEVEL: $LOGLEVEL"
log_debug "Parameter LOG_FILE: $LOG_FILE"
#
## end getopts
#
## create lock file
lockfile -r0 "$LOCK_FILE" 2>>"$LOG_FILE"
lock_res=$?
if [[ $lock_res -ne 0 ]]; then
    log_warning "Script currently running. If you are confident this script is not runnig, remove file $LOCK_FILE and then restart script"
    log_warning "Or, maybe, your does not have a lockfile utility"
    exit 1
fi
#
if [[ $# -ne 0 ]]; then
    TABLETS=($@)
    GET_LIST_FROM_DB=no
else
    ## request list of tablet's names from database or anywhere else (create array of names)
    TABLETS=($(curl -f http://$HOSTNAME/api/rsync/get_list 2> /dev/null))
    GET_LIST_FROM_DB=yes
fi
#
## main
if ! [[ -z $TABLETS ]]; then
    log_debug "Tablets list: ${TABLETS[*]}"
    for TABLET_NAME in ${TABLETS[*]}
    do
        sync_tablet $TABLET_NAME
    done
else
    log_info "Nothing for syncing"
fi



rm -fr "$LOCK_FILE"
# set +x
exit 0
