# ml-dockers
Repository for building an image that is out-of-the-box usable for image-based machine learning applications.
Compatible with NVIDIA GPUs, the built docker image includes Python version of your choice,
PyTorch, OpenCV, Scikit-learn and other ML targeted libraries. 

# Requirements
- NVIDIA GPU
- If running on Windows WSL, ensure it is WSL 2
	- `wsl -l -v` - to check running environments
	- `wsl --set-version <environment> 2` To update the WSL
- Docker

# Workflow

- Setup the environment with `./setup_environment.sh`
- `cd docker`
- `./build.sh` (Then go for a stroll around the city, takes a while)
	- The build can successfully finish, but fail to return cli control, use CTRL+C after a while
- `./run.sh` - Enjoy the fully empowered image


