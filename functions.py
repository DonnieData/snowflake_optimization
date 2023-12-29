#funciton to empty of dir
#include "/" at the end of dir path 

def clear_dir(dir_path): 
    import os
    for i in os.listdir(dir_path):
        os.remove(f"{dir_path}{i}")
    
    
    