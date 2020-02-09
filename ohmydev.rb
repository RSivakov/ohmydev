class Ohmydev < Formula
  desc "Установка всякой полезной хуйни для разработки"
  homepage "https://github.com/rsivakov/ohmydev"
  url "https://github.com/RSivakov/homebrew-ohmydev/archive/v0.1.2.zip"
    sha256 "6c3f5a5a3211608ebf2aae23853e22334f23724b253b0b367ef8790854d35a1c"
   depends_on "docker"
   def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
   system "unzip ~/Library/Caches/Homebrew/ohmydev--0.1.1.zip  /usr/local/Cellar -j"
   system "cd /usr/local/Cellar/", "mv ./ohmydev--0.1.1 ./ohmydev"
   system "mkdir ~/.ohmydev"
   #system "cp /usr/local/Cellar/ohmydev/cli/cli.yaml ~/.sonm/cli.yaml"
   #system "cp /usr/local/Cellar/sonm/hub/hub.yaml ~/.sonm/hub.yaml"
   #system "cp /usr/local/Cellar/sonm/node/node.yaml ~/.sonm/node.yaml"
   #system "cp /usr/local/Cellar/sonm/cli/worker.yaml ~/.sonm/worker.yaml"




   system "cd /usr/local", "ln -s bin"
   system "ln ./sonm/cli/sonmcli_darwin64 "


end
   test do
    #`test do` will create, run in and delete a temporary directory.
    #
    #This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test core`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"

  end
bottle do
  root_url "https://sonm.com"
  prefix "sonm"
  cellar "/opt/homebrew/Cellar"
  #revision 1
end

end