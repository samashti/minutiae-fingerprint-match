# MinutiaeFingerprintMatch

Minutiae-based Fingerprint Matching

__________________________________

Automatic and reliable extraction of minutiae from fingerprint images based on the frequency and orientation of the local ridges and
thereby extracting correct minutiae points and used to match fingerprints in one-to-one matching or one-to-many matching.

## Scripts
(matlab)

1. `main_single.m`: In case of matching two fingerprint images and identifying the match percantage, use this script and provide the path argumnets to both images.

2. `main_total.m` : This script is used to find the matching fingerprint for an input image from all the fingerprints stored in the database.


## Limitations

The current implementation only focuses on improving alternatives for the image enhancement process, leading consequently to an increase of the reliability in the minutiae extraction task. The task gets very slow in case of one-to-many fingerprint matching when the database has a huge set of fingerprints.


Read the [report](https://github.com/nsh-764/MinutiaeFingerprintMatch/blob/master/Docs/Report.pdf) and [presentation](https://github.com/nsh-764/MinutiaeFingerprintMatch/blob/master/Docs/Final%20Presentation.pdf) for more detailed explanation on the project.

Test outputs results are available [here](https://github.com/nsh-764/MinutiaeFingerprintMatch/blob/master/Docs/Results%20on%20Testset.pdf)

