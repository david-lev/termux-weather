# Termux-weather ⛅

### Using the following script you can get the weather directly to your Termux app!
---
Run the folowing command on your termux app:
```bash
bash <(curl -s https://raw.githubusercontent.com/david-lev/termux-weather/main/termux-weather.sh)
```
- The requierments are: `termux-api`, `curl`, and `jq`.
---
The script accesses the device location using the [Termux-api](https://wiki.termux.com/wiki/Termux:API) package. The [timeout variable](https://github.com/david-lev/termux-weather/blob/main/termux-weather.sh#L11) that appears at the beginning of the script indicates the time that the script will wait for the device to respond. It will then be possible to manually type a city name or use the IP address (inaccurate location) to get the coordinates.
