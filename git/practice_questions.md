Generated markdown
# Git Practice Questions (Beginner, Intermediate, Advanced)

This document provides practice questions for testing your Git knowledge, categorized by difficulty level (Beginner, Intermediate, Advanced).

## Beginner Level Questions

1.  **Question:** What is the purpose of the `git init` command? How do you use it?
    **Answer:** The `git init` command initializes a new Git repository in the current directory. It's used to start tracking changes in a project.
    **Command:** `git init`

2.  **Question:** How do you check the status of your working directory in Git? What information does `git status` provide?
    **Answer:** You use the `git status` command. It shows the status of your working directory, including staged changes, unstaged changes, and untracked files.
    **Command:** `git status`

3.  **Question:** Explain the difference between the working directory, the staging area, and the Git repository.
    **Answer:**
    *   **Working Directory:** The local directory where you work on your files.
    *   **Staging Area (Index):** A holding area where you prepare changes for the next commit.
    *   **Git Repository:** The database that stores the project's history and metadata.

4.  **Question:** How do you add changes to the staging area in Git? What's the difference between `git add <file>` and `git add .`?
    **Answer:** You use the `git add` command.
    *   `git add <file>`: Adds a specific file to the staging area.
    *   `git add .`: Adds all changes in the current directory to the staging area.
    **Commands:** `git add <file>`, `git add .`

5.  **Question:** How do you create a new commit in Git? What's the importance of writing a good commit message?
    **Answer:** You use the `git commit` command. A good commit message should be concise and descriptive, explaining the purpose of the changes.
    **Command:** `git commit -m "Commit message"`

6.  **Question:** How do you view the commit history in Git? What are some useful options for the `git log` command?
    **Answer:** You use the `git log` command.
    *   `git log`: Basic log output.
    *   `git log --oneline`: Concise one-line output.
    *   `git log --graph`: Visualizes branches.
    **Command:** `git log`, `git log --oneline`, `git log --graph`

## Intermediate Level Questions

1.  **Question:** What is a branch in Git? How do you create, list, and switch between branches?
    **Answer:** A branch is a lightweight, movable pointer to a commit.
    *   Create: `git branch <branch_name>`
    *   List: `git branch`
    *   Switch: `git checkout <branch_name>`
    **Commands:** `git branch`, `git checkout`

2.  **Question:** Explain the concept of merging in Git. How do you merge one branch into another? What are merge conflicts, and how do you resolve them?
    **Answer:** Merging integrates changes from one branch into another.
    *   Merge: `git checkout <target_branch>`, `git merge <branch_to_merge>`
    *   Merge Conflicts: Occur when Git cannot automatically merge changes.
    *   Resolution: Manually edit the conflicted files, then `git add` and `git commit`.

3.  **Question:** How do you connect a local Git repository to a remote repository (e.g., GitHub, GitLab)? Explain the purpose of `git remote add origin <remote_url>`.
    **Answer:** You use the `git remote add` command.
    *   `git remote add origin <remote_url>`: Adds a remote repository named "origin."
    **Command:** `git remote add origin <remote_url>`

4.  **Question:** Explain the difference between `git push` and `git pull`. How do you push changes to a remote repository and pull changes from a remote repository?
    **Answer:**
    *   `git push`: Uploads local commits to a remote repository.
    *   `git pull`: Fetches changes from a remote repository and merges them into your local branch.
    **Commands:** `git push origin <branch_name>`, `git pull origin <branch_name>`

5.  **Question:** How can you undo changes in Git? Explain the difference between `git checkout <file>` and `git reset <commit_hash>`. When should you use each command?
    **Answer:**
    *   `git checkout <file>`: Reverts specific file(s) in the working directory.
    *   `git reset <commit_hash>`: Moves the commit pointer (rewrites history - use with caution).
    *   `git revert <commit_hash>`: Creates a new commit to undo a previous commit.

6.  **Question:** What is the purpose of a `.gitignore` file? How do you use it to exclude files from being tracked by Git?
    **Answer:** The `.gitignore` file specifies intentionally untracked files that Git should ignore. Add patterns (e.g., `*.log`, `/build/`) to the file.

## Advanced Level Questions

1.  **Question:** Explain different branching strategies (e.g., Gitflow, GitHub Flow). What are the pros and cons of each, and when would you use them?
    **Answer:**
    *   **Gitflow:** Main, develop, feature, release, hotfix branches (complex projects).
    *   **GitHub Flow:** Main branch, feature branches (simpler projects, continuous delivery).

2.  **Question:** What are Git hooks? Give some examples of how you can use them in a DevOps workflow.
    **Answer:** Scripts that run automatically before or after Git events.
    *   Examples: Code quality checks, security audits, automated tasks.

3.  **Question:** Explain the difference between `git merge` and `git rebase`. When is it appropriate to use each command? What are the potential dangers of using `git rebase` on shared branches?
    **Answer:**
    *   `git merge`: Creates a merge commit.
    *   `git rebase`: Rewrites history (avoid on shared branches).

4.  **Question:** How do you resolve complex merge conflicts in Git? What are some strategies and tools you can use to make the process easier?
    **Answer:**
    *   Use visual merge tools (e.g., VS Code, GitKraken).
    *   Communicate with collaborators.
    *   Break down large merges into smaller ones.

5.  **Question:** How can you manage submodules or subtrees in Git? What are the use cases for each approach?
    **Answer:** Managing dependencies and external projects.
    *   **Submodules:** Store external repositories as separate entities within your repository.
    *   **Subtrees:** Merge the history of another repository into your own.

6.  **Question:** How can you use Git to manage infrastructure as code (IaC)? What are some best practices for storing and versioning infrastructure configurations?
    **Answer:**
    *   Store infrastructure code in Git repositories.
    *   Use branching and pull requests for infrastructure changes.
    *   Implement code review for infrastructure code.
    *   Automate deployments using CI/CD pipelines.
    *   Store secrets securely.
