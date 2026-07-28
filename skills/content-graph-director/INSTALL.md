# Install Content Graph Director

## Give this command to Codex or Cursor

Place `skill.zip` somewhere the agent can access, then paste:

```text
Install the Content Graph Director Agent Skill from the available skill.zip file. Extract it to a temporary directory, locate the folder containing SKILL.md, and run its included installer for both Codex and Cursor. On macOS or Linux run `sh scripts/install.sh --all --user`. On Windows run `powershell -ExecutionPolicy Bypass -File scripts/install.ps1 -Target all`. Verify that `content-graph-director/SKILL.md` exists under both my global Codex and Cursor skill directories. Back up any existing copy, do not modify the current project, and tell me when I should start a new chat.
```

The installer copies the skill to:

- Codex: `~/.agents/skills/content-graph-director`
- Cursor: `~/.cursor/skills/content-graph-director`

It uses direct copies rather than symlinks and moves any previous installation to a timestamped backup folder.

## Direct terminal use

From the extracted `content-graph-director` folder:

```bash
sh scripts/install.sh --all --user
```

On Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install.ps1 -Target all
```

For a repository-scoped installation:

```bash
sh scripts/install.sh --all --project /path/to/repository
```

After installation, start a new chat. Invoke the skill as `$content-graph-director` in Codex or `/content-graph-director` in Cursor.
