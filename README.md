# STM32 Cube IDE Docker image

### Build your project

1. `cd <my-project>`
2. `docker run --rm -v $(pwd):/home/stm/Project olback/stm32cubeide
`

### Build image

1. [Download the latest DEB bundle from STM](https://www.st.com/en/development-tools/stm32cubeide.html#get-software).
2. Move the downloaded `*_amd64.deb_bundle.sh.zip` to this directory.
3. Build the image. `docker build -t stm32cubeide .`
