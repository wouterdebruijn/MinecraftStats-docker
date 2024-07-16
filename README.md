# MinecraftStats in a container
This is a container that runs [MinecraftStats](https://github.com/pdinklag/MinecraftStats) to generate statistics for a Minecraft server. It uses nginx to serve the generated website containing the statistics. The statistics are generated using a cron job that runs at a adjustable beds interval.

## Under development, image not available through Docker Hub yet

## Usage
To use this container, you need to mount the Minecraft server directory to `/app/minecraft`. The statistics will be served on port 80, which you can map to any port you want. For production use, you should serve the website using a reverse proxy like traefik or caddy.