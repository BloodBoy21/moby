# Moby docker cli 

This is repository for scripts that work with docker cli.

## Usage

### Moby 🐳
  Command list for moby cli
  - ```-l``` - log container
  - ```-s``` - stop container
  - ```-r``` - restart container
  - ```-d``` - delete container
  - ```-b``` - attach container to bash
  
  by default script will use ```-l``` option if no option is provided

  Example:
  ```bash
  moby -s #will stop container selected by fzf
  ```

### Moby-compose 🐳🖥️
  Command list for moby-compose cli
  - ```-u``` - up container
  - ```-d``` - down container
  - ```-b``` - attach container to bash
  
  by default script will use ```-u``` option if no option is provided

  Example:
  ```bash
  moby-compose -d #will down docker-compose file selected by fzf
  ```

## Installation 
```bash
  git clone https://github.com/BloodBoy21/moby.git
  cd moby
  chmod +x install.sh
  ./install.sh
```

## Note
  - If you want to use moby-compose you need to install docker-compose
  - If you want to use moby you need to install docker
  - Please use ```sudo``` if you are not root user
  - Install [fzf](https://github.com/junegunn/fzf) to use moby cli