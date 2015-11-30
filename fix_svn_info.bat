REM I have NOT yet tested this batch file!!

REM Change to CodeBlocks folder or exit with value 1.
cd CodeBlocks || exit 1

REM Setup the Git CodeBlocks Submodule SVN configure using https protocol
git config svn-remote.svn.url https://svn.code.sf.net/p/codeblocks/code
git config svn-remote.svn.fetch trunk:refs/remotes/svn/trunk

REM If the "git svn fetch" errors out check to make sure
REM    FireWall is setup correctly.
REM This fetch takes a long time; but, not more than 30 minutes, normally
REM    And, the command outputs to the terminal at a steady rate.
git svn fetch -r 10604

REM Set the commit hash to match the one for SVN Rev 10604
echo 1c43e9d3d7adc948f21f11f80aff109782ba8929 > ../.git/modules/CodeBlocks/refs/remotes/svn/trunk

REM This fetch takes a long time; but, not more than 30 minutes, normally
REM    And, the command outputs to the terminal at a steady rate.
REM I am guessing it creates a cross reference table from SVN Rev to Git Hash
git svn fetch -r 10604

REM re-run the fetch to speedup the "git svn info".
REM    Sometimes, I think the "git svn info" locks up when 
REM    it was just running the "fetch" command with no output to terminal.
git svn fetch

REM Test to make sure the git svn info works;
REM    This command is quick (less than 2 minutes); 
REM    but, displays no output till it is done.
git svn info

REM PAUSE
