
# Flowtron on RTX 4090

This repository demonstrates how to run NVIDIA's Flowtron text-to-speech synthesis model on an RTX 4090 GPU using Docker and Docker Compose. The setup leverages GPU acceleration to efficiently handle the computational load of training and inference. Docker image has all model checkpoints and sample data downloaded to allow for straight forward `inference_style_transfer.ipynb` notebook execution.

## Prerequisites

- **NVIDIA GPU**: Ensure you have an NVIDIA GPU (e.g., RTX 4090) with the latest drivers installed.
- **Docker**: Install Docker on your machine. Instructions can be found [here](https://docs.docker.com/get-docker/).
- **Docker Compose**: Install Docker Compose. Instructions can be found [here](https://docs.docker.com/compose/install/).

## Setup Instructions

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/aleksas/flowtron.git
    cd flowtron
    ```

2. **Build the Docker Image**:
    Use the provided `Dockerfile` and `docker-compose.yml` to build the Docker image.
    ```bash
    docker-compose build
    ```

3. **Run the Container**:
    Start the container with GPU support.
    ```bash
    docker-compose up
    ```

4. **Access the Jupyter Notebook**:
    Open your web browser and navigate to `http://localhost:8898` to access the Jupyter notebook interface. You can start experimenting with Flowtron using the GPU-accelerated environment.

## Files in This Repository

- `Dockerfile`: Defines the Docker image, including all dependencies and necessary setup.
- `docker-compose.yml`: Orchestrates the container setup, ensuring the correct ports and GPU settings.
- Pre-trained models: Automatically downloaded during the build process.

## Acknowledgements

- Original Flowtron repository by NVIDIA: [https://github.com/NVIDIA/flowtron](https://github.com/NVIDIA/flowtron)
- This setup is configured and tested to work on RTX 4090, enabling faster processing and experimentation.

## License

This project is licensed under the MIT License. See the original Flowtron repository for more details.
