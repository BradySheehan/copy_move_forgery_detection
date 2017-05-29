# Copy Move Forgery Detection
This is an implementation and variation of a copy move forgery algorithm based on the algorithm in Fridrich's paper in 2003. 

This is a program for determining if an image was a victim of copy-move forgery. The program accepts an image and two arguments (quality factor and threshold), a third optional argument indicates whether or not the input image is in color. After analyzing an image, the program outputs an image with the alleged copy-move regions highlighted.

The main purpose of this project was to highlight an expected deficiency of this approach to forgery detection - this algorithm (due to the discrete cosine transform) is not invariant to any rotation or scaling in the copy-move region.

## Note:
If you would like use this work in a project, paper, or other technical document that you are creating, please cite the original Fridrich (2003) paper as well as the final_paper.pdf in the paper directory.
