FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /opt
COPY *.csproj ./
RUN dotnet restore
COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /opt
COPY --from=build /opt/out .
ENTRYPOINT ["dotnet","PoojaStores.dll"]
