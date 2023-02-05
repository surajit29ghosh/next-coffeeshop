# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app
COPY ProductService.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o /publish --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /publish ./
EXPOSE 8080
ENTRYPOINT ["dotnet", "ProductService.dll"]
