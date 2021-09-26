# Termux-weather ⛅

### Using the following script you can get the weather directly to your terminal!
![Alt image](https://telegra.ph/file/eb29015338c430ac1e051.jpg)
---
Run the folowing command on your terminal:
```bash
bash <(curl -Ls bit.ly/termux-weather)
```
Or (No Redirecting):
```bash
bash <(curl -s https://raw.githubusercontent.com/david-lev/termux-weather/main/termux-weather.sh)
```
- The requierments are: `termux-api`, `curl`, and `jq`.
---
The script accesses the device location using the [Termux-api](https://wiki.termux.com/wiki/Termux:API) package. The [timeout variable](https://github.com/david-lev/termux-weather/blob/main/termux-weather.sh#L11) that appears at the beginning of the script indicates the time that the script will wait for the device to respond. It will then be possible to manually type a city name or use the IP address (inaccurate location) to get the coordinates.
