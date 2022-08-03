# Application Inspector GitHub Action

Microsoft Application Inspector is a software source code characterization tool that helps **identify coding features of first or third party software components** based on well-known library/API calls and is helpful in security and non-security use cases. It uses hundreds of rules and regex patterns to surface interesting characteristics of source code to aid in determining **what the software is** or **what it does** and received industry attention as a new and valuable contribution to OSS on [ZDNet](https://www.zdnet.com/article/microsoft-application-inspector-is-now-open-source-so-use-it-to-test-code-security/
), [SecurityWeek](https://www.securityweek.com/microsoft-introduces-free-source-code-analyzer), [CSOOnline](https://www.csoonline.com/article/3514732/microsoft-s-offers-application-inspector-to-probe-untrusted-open-source-code.html), [Linux.com/news](https://www.linux.com/news/microsoft-application-inspector-is-now-open-source-so-use-it-to-test-code-security/), [HelpNetSecurity](https://www.helpnetsecurity.com/2020/01/17/microsoft-application-inspector/
), Twitter and more and was first featured on [Microsoft.com](https://www.microsoft.com/security/blog/2020/01/16/introducing-microsoft-application-inspector/).

The tool supports scanning various programming languages including C, C++, C#, Java, JavaScript, HTML, Python, Objective-C, Go, Ruby, PowerShell and [more](https://github.com/microsoft/ApplicationInspector/wiki/2.1-Field:-applies_to-(languages-support)) and can scan projects with mixed language files.

Be sure to see our project wiki page for more help https://Github.com/Microsoft/ApplicationInspector/wiki for **illustrations** and additional information and help.

This Action calls the Analyze functionality of Application Inspector.

## Usage

Add ApplicationInspector to your GitHub Actions pipeline like below to scan the repository root and output to `AppInspectorResults.json` in the repository root.

```
- uses: actions/checkout@v2
- uses: microsoft/ApplicationInspector-Action@v1
- uses: actions/upload-artifact@v2
    with:
        name: AppInspectorResults
        path: AppInspectorResults.json
```

A common use case is to run Application Inspector in tags only mode

```
- uses: microsoft/ApplicationInspector-Action@v1
      with:
        arguments: -t
```

You can also specify a number of options to the action.  See the Application Inspector [wiki](https://github.com/microsoft/ApplicationInspector/wiki/1.-CLI-Usage#analyze-command) for guidance.  Use the documentation for the `analyze` command.

```
- uses: microsoft/ApplicationInspector-Action@v1
  with:
    location-to-scan: relative/path/in/repo
    output-path: relative/path/in/repo
    output-format: [json | text]
    file-path-exclusions: comma,separated,glob,patterns
    arguments: -any -arguments -to -analyze
    pre-release: [ true | false ]
```

## Main Project

The engine powering this GitHub Action is also available [here](https://github.com/Microsoft/ApplicationInspector) as a Cli.

# Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
