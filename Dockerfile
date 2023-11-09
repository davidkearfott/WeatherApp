FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore "WeatherApp.csproj"

# Copy everything else and build
COPY . ./
# RUN dotnet publish --no-restore -c Release -o out
RUN dotnet publish "WeatherApp.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
EXPOSE 80
EXPOSE 443
COPY --from=build-env /app/publish .
ENTRYPOINT ["dotnet", "WeatherApp.dll"]