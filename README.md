# myip
Bash script to fetch IP address information.  
To obtain information, a request will be sent to [ipinfo.io](https://ipinfo.io/)

## Dependencies
- `curl`
- `jq`

## Installation
1. Install Dependencies
```bash
sudo apt install jq curl
```

2. Download the script:
```bash
curl -O https://raw.githubusercontent.com/imtoopunkforyou/myip/refs/heads/main/myip.sh
```

3. Make executable:
```bash
chmod +x myip.sh
```

## Usage
- Simply run:
```bash
./myip.sh
```

## Alias Setup
Add to your shell configuration (.bashrc/.zshrc):
```bash
alias myip="/path/to/myip.sh"
```

## Example output:
```
┌─────────────────────────────┐
│       IP Information        │
└─────────────────────────────┘

IP:           123.456.78.90
Hostname:     null
City:         CityName
Region:       Region Name
Country:      RN (12.3456,7.8910)
Postal Code:  1122
Organization: Organization Name.
```