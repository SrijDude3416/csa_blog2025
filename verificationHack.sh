#!/bin/bash

file_name="./_posts/Foundation/C-Sprint1/2024-08-22-verify-tools.md"

if [ -f "$file_name" ]; then
    rm $file_name
fi

touch $file_name

echo "---
layout: post
title: Sprint 1 - Verify Tools
description: Verifying Tools and Software for Sprint 1
type: collab
courses: {'csa': {'week': 3}}
comments: True
categories: ['Collaboration']
---
" >> $file_name

printCommand () {
    echo "\`\`\`"
    echo "Input: $1"
    echo "Output: $($1)"
    echo "\`\`\`"
}

verifyInstallations () {
    echo "----------------- Checking git version -----------------"
    printCommand "git --version"
    echo "----------------- Checking ruby version -----------------"
    printCommand "ruby -v"
    echo "----------------- Checking python version -----------------"
    printCommand "python --version"
    echo "----------------- Verifying Jupyter Kernels -----------------"
    printCommand "jupyter kernelspec list"
}

createEnvVariables () {
    echo "Verifying creation of project environment variables"


    export project_dir=$HOME/vscode  # change nighthawk to different name to test your git clone
    export project=\$project_dir/srijan_2025  # change portfolio_2025 to name of project from git clone
    export posts=\$project/_posts
    export notebooks=\$project/_notebooks
    export project_repo="https://github.com/nighthawkcoders/srijan_2025.git"
    
    printCommand "echo \"Repos home dir: $project_dir\""
    printCommand "echo \"Project dir: $project\""
    printCommand "echo \"Posts dir: $posts\""
    printCommand "echo \"Notebooks dir: $notebooks\""
    printCommand "echo \"Repo: $project_repo\""
}

verifyGithubInfo () {
    echo "Verifying configuration of GitHub "

    printCommand "git config --global --list"

}

verifyInstallations >> $file_name
createEnvVariables >> $file_name
verifyGithubInfo >> $file_name