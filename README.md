# Gen8
A command-line tool for quickly scaffolding new projects from pre-defined templates.
This program only supports basic C program and basic Python program
## Installation and Usage
1. Clone the repository
```bash
git clone https://github.com/Ddilibe/gen8.git
cd gen8
``` 
2. Install as a system command using symlink. It ensures that the script works globally
```bash
chmod +x gen8
ln -s gen8 /bin/gen8
```
3. Reload your shell configuration
```bash
source ~/.bashrc
```
4. Gen8 can now be used globally
```bash
gen8 <project_name>
# Then pick the template you would want
```

## Templates

This generator offers a variety of templates to cater to different project types and frameworks.
We intend to create more templates

**Available Templates:**

*   `default.c`: A template for creating basic C applications.  Includes a basic project structure, a header file, makefile and a READ file.
*   `default.py`: A template for creating Python libraries.  Includes a setup script and a basic module structure.
