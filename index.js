#!/usr/bin/env node

import chalk from "chalk";
import clear from "clear";
import figlet from "figlet";



// const chalk = Ch;
// const clear = require('clear');
// const figlet = require('figlet');

// Libs
const files = require('./lib/files.js');
const inquirer  = require('./lib/inquirer');
const github = require('./lib/github');
const repo = require('./lib/repo');
// import files from "./lib/files.js";
// import inquirer from "./lib/inquirer.js";
// import github from "./lib/github.js";
// import repo from "./lib/repo.js";


clear();

console.log(
  chalk.yellow(
    figlet.textSync('Ginit', { horizontalLayout: 'full' })
  )
);

if (files.directoryExists('.git')) {
    console.log(chalk.red('Already a Git repository!'));
    process.exit();
}


const run = async () => {
    try {
      // Retrieve & Set Authentication Token
      const token = await getGithubToken();
      github.githubAuth(token);
  
      // Create remote repository
      const url = await repo.createRemoteRepo();
  
      // Create .gitignore file
      await repo.createGitignore();
  
      // Set up local repository and push to remote
      await repo.setupRepo(url);
  
      console.log(chalk.green('All done!'));
    } catch(err) {
        if (err) {
          switch (err.status) {
            case 401:
              console.log(chalk.red('Couldn\'t log you in. Please provide correct credentials/token.'));
              break;
            case 422:
              console.log(chalk.red('There is already a remote repository or token with the same name'));
              break;
            default:
              console.log(chalk.red(err));
          }
        }
    }
  };














const filelist = _.without(fs.readdirSync('.'), '.git', '.gitignore');
