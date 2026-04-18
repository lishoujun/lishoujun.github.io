# AGENTS.md

## Workflow preference for this repository

- Default language for responses: English.
- Before the first code edit in each task, run `git pull` on the current working branch.

## Cursor Cloud specific instructions

- For most tasks in this repository, **do not** proactively install npm dependencies.
- For most tasks in this repository, **do not** proactively start local services/web servers.
- Unless the user explicitly requests full build/test verification, focus on:
  - checking latest ESR versions for Firefox and Thunderbird,
  - updating `deepin/package/org.mozilla.firefox-esr/package.sh`,
  - updating `deepin/package/net.thunderbird/package.sh`,
  - validating script syntax and source URL reachability.

## Typical high-signal checks for version bump tasks

- `bash -n deepin/package/org.mozilla.firefox-esr/package.sh`
- `bash -n deepin/package/net.thunderbird/package.sh`
- `wget -S --spider <firefox-esr-url>`
- `wget -S --spider <thunderbird-esr-url>`
