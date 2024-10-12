# EssentialsR
![Alt](https://repobeats.axiom.co/api/embed/1a1072d5fae9ea3f21576f4002b1715137928923.svg "Repobeats analytics image")

This repository is a fork of [EssentialsX-Folia](https://github.com/Euphillya/Essentials-Folia) specifically modified to work with RaionBowCreation Network.

## Prerequisites

Before starting, make sure you have the following tools installed on your system:

- Git
- Bash (if you are on Windows, you can use Git Bash or WSL)
- Java Development Kit 21 (JDK) to compile the plugin

## Download

You can download the plugins here: https://github.com/RainBowCreation/EssentialsR/actions

## Installation

### Cloning the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/RainBowCreation/EssentialsR.git
cd EssentialsR
```

### Using the Script

A Bash script is provided to manage recloning, creating, and applying patches. Here's how to use it:

### Update the Repository by Recloning

To update the source code by deleting and recloning the original EssentialsX repository:

```bash
./script.sh updateUpstream
```

This command will:
1. Remove the local directories `Essentials` and `Essentials-Patchs`.
2. Remove the local directories `core` and `core-Patchs`.
3. Re-clone the `EssentialsX` repository into the `Essentials` directory.
4. Re-clone the `core` repository into the `core` directory.
5. Copy the contents of `Essentials` to `Essentials-Patchs`.
6. Copy the contents of `core` to `core-Patchs`.

### Create Patches

To create patches from changes made in the `Essentials-Patchs` directory:

```bash
./script.sh createPatches
```

Patches will be generated in the `patches/plugins` directory.

### Apply Patches

To apply existing patches to the `Essentials-Patchs` directory:

```bash
./script.sh applyPatches
```

This command will apply each patch found in `patches/plugins` and create a commit for each applied patch.

## Directory Structure

- `Essentials/`: Cloned directory from the original EssentialsX repository.
- `Essentials-Patchs/`: Working directory where modifications are made and patches are applied.
- `patches/plugins/`: Directory containing the generated patch files.

## Contributing

If you wish to contribute to this project, please follow these steps:

1. Fork this repository.
2. Create a branch for your feature (`git checkout -b my-feature`).
3. Make your changes in the `Essentials-Patchs` directory.
4. Create patches with `./script.sh createPatches`.
5. Commit and push your patches to your fork.
6. Create a pull request on this repository.

## Help

For any questions or issues, feel free to open an [issue](https://github.com/RainBowCreation/EssentialsR/issues).

## License

This project is licensed under the MIT License. For more information, please see the [LICENSE](LICENSE) file.
