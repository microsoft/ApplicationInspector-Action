# Application Inspector

Microsoft Application Inspector is a software source code characterization tool that helps **identify coding features of first or third party software components** based on well-known library/API calls and is helpful in security and non-security use cases. It uses hundreds of rules and regex patterns to surface interesting characteristics of source code to aid in determining **what the software is** or **what it does** and received industry attention as a new and valuable contribution to OSS on [ZDNet](https://www.zdnet.com/article/microsoft-application-inspector-is-now-open-source-so-use-it-to-test-code-security/
), [SecurityWeek](https://www.securityweek.com/microsoft-introduces-free-source-code-analyzer), [CSOOnline](https://www.csoonline.com/article/3514732/microsoft-s-offers-application-inspector-to-probe-untrusted-open-source-code.html), [Linux.com/news](https://www.linux.com/news/microsoft-application-inspector-is-now-open-source-so-use-it-to-test-code-security/), [HelpNetSecurity](https://www.helpnetsecurity.com/2020/01/17/microsoft-application-inspector/
), Twitter and more and was first featured on [Microsoft.com](https://www.microsoft.com/security/blog/2020/01/16/introducing-microsoft-application-inspector/).

Application Inspector is different from traditional static analysis tools in that it doesn't attempt to identify "good" or "bad" patterns; it simply reports what it finds against a set of over 400 rule patterns for feature detection including features that impact security such as the use of cryptography and more.  This can be extremely helpful in reducing the time needed to determine what Open Source or other components do by examining the source directly rather than trusting to limited documentation or recommendations.  

The tool supports scanning various programming languages including C, C++, C#, Java, JavaScript, HTML, Python, Objective-C, Go, Ruby, PowerShell and [more](https://github.com/microsoft/ApplicationInspector/wiki/2.1-Field:-applies_to-(languages-support)) and can scan projects with mixed language files.  It also includes HTML, JSON and text output formats with the default being an HTML report similar to the one shown here.

![AppInspector-Features](https://user-images.githubusercontent.com/47648296/72893326-9c82c700-3ccd-11ea-8944-9831ea17f3e0.png)

It includes a filterable confidence indicator to help minimize false positives matches as well as customizable default rules and conditional match logic.  

Be sure to see our project wiki page for more help https://Github.com/Microsoft/ApplicationInspector/wiki for **illustrations** and additional information and help.

## Usage

Add ApplicationInspector to your GitHub Actions pipeline like below to scan the repository root and output to `AppInspectorResults.json` in the repository root.

```
    - uses: actions/checkout@v2
    - uses: microsoft/ApplicationInspector-Action@1
```

You can also specify a number of options to the action.  See the main Application Inspector documentation for the arguments you can pass.

```
    - uses: microsoft/ApplicationInspector-Action@v1
      with:
      location-to-scan: relative/path/in/repo
      output-path: relative/path/in/repo
      output-format: [html | json | text]
      arguments: -any -arguments -to -appinspector
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
