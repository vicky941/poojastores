# Use the official .NET SDK as the base image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the remaining source code
COPY . .

# Build the application
RUN dotnet publish -c Release -o out

# Create the runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
COPY --from=build /app/out ./

# Specify the entry point for the application
ENTRYPOINT ["dotnet", "YourApp.dll"]
