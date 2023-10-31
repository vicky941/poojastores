# Use the official .NET SDK as a build image
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

WORKDIR /app

# Copy the .csproj and restore any dependencies (if necessary)
COPY *.csproj ./
RUN dotnet restore

# Copy the remaining source code
COPY . .

# Build the application
RUN dotnet publish -c Release -o out

# Use the official .NET runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime

WORKDIR /app

# Copy the built application from the build image
COPY --from=build /app/out .

# Specify the entry point for the container
ENTRYPOINT ["dotnet", "YourAppName.dll"]
