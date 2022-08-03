FROM mcr.microsoft.com/dotnet/sdk:6.0

RUN mkdir /tools

RUN dotnet tool install --tool-path /tools Microsoft.CST.ApplicationInspector.Cli

# Attempt to also install a beta if it exists, this defaults to the standard release if it is newer
RUN dotnet tool install --tool-path /beta-tools Microsoft.CST.ApplicationInspector.Cli --prerelease

COPY entrypoint.sh /entrypoint.sh

RUN chmod 777 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
