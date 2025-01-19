# ml-dockers
Repository for building an image that is out-of-the-box usable for image-based machine learning applications.
Compatible with NVIDIA GPUs, the built docker image includes Python version of your choice,
PyTorch, OpenCV, Scikit-learn and other ML targeted libraries. There are libraries included for a HuggingFace
based inference of Stable Diffusion models. You can delete them from `requirements.txt` if not needed. Similarily,
edit `requirements.txt` anyhow you want.

# Requirements
- NVIDIA GPU
- Docker
	- If running on Windows WSL, ensure it is WSL 2
	- `wsl -l -v` - to check running environments
	- `wsl --set-version <environment> 2` To update the WSL

# Workflow

- Setup the environment with `./setup_environment.sh`
	- If this is your first setup, either leave `docker/dockerenv.sh` as is, or delete it. 	
- `cd docker`
- `./build.sh`
- `./run.sh` - Enjoy the image.


