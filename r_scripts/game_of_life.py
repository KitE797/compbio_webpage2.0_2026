## Proper repository structure:

# Root Folder: (name of repository)
#     driver.py
#     readme.txt (text file with metadata about the entire reposirtory: what is the repository for, who's working on it, other info)
#     .gitignore (code and text files of big datasets)
#     licence.txt (protect you from other people profiting off of it)
#     data (folder)
#         data1.csv
#         data2.tif
#         data3.txt
#     functions (folder) (store your functions, then call them with a driver)
#         function_1.py
#         function_2.py
#         function_3.py
#     figures (folder)
#         figure1.pdf
#         figure2.pdf
#     documents (folder)
#         draft1.md
#         proposal.docx

###############################################################################
### Conway's Game of Life:

## Rules:
# Underpopulation: Any live cell with fewer than 2 live neighbors dies.
# Survival: Any live cell with 2 or 3 neighbors survives.
# Overpopulation: Any live cell with more than 3 neighbors dies.
# Reproduction: Any deda cell with exactly 3 live neighbors becomes alive.

## Neighbors:
# Moore: eight surrounding cells
# Von Neumann: 4 orthogonal neighbors
# Extended Moore: increased radius of neighbors- longer range interactions
