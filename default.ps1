Task build -depends update-version `
{

}

Task update-version `
{
    $branchName = Exec { GitVersion /showvariable BranchName }
    if ($branchName -eq 'master')
    {
        $preReleaseTag = Exec { GitVersion /showvariable PreReleaseTag }
        if ($preReleaseTag)
        {
            $majorMinorPatch = Exec { GitVersion /showvariable MajorMinorPatch }
            throw "Production releases without tag are not allowed. Suggested tag: $majorMinorPatch"
        }
    }
}
