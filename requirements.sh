# Definitions.
HOME_DIR=/home/repl
USER_GROUP=repl:repl
COURSE_ID=course_5160
ARCHIVE=filesys.zip

# Report start.
echo ''
echo '----------------------------------------'
echo 'STARTING requirements.sh at ' $(date)
echo 'HOME_DIR: ' ${HOME_DIR}
echo 'USER_GROUP: ' ${USER_GROUP}
echo 'COURSE_ID: ' ${COURSE_ID}
echo 'ARCHIVE: ' ${ARCHIVE}
echo

# Make sure we're in the home directory.
cd ${HOME_DIR}

# Get the zip file.
wget https://s3.amazonaws.com/assets.datacamp.com/production/${COURSE_ID}/datasets/${ARCHIVE}

# Make sure we have the following commands:
# - unzip (for installation)
# - tree (for displaying file system)
apt-get update
apt-get -y install unzip
apt-get -y install tree

# Unpack to the local directory.
unzip ./${ARCHIVE}

# Remove the zip file.
rm -f ./${ARCHIVE}

# Make the `backup` and `bin` directories (which start off empty).
mkdir ./backup

# Change ownership.
chown -R ${USER_GROUP} .

# Change prompt.
echo "export PS1='\$ '" >> ${HOME_DIR}/.bashrc

# Show what's been done where.
echo 'Installed in home directory:'
ls -R ${HOME_DIR}/*
echo
echo 'Last 10 lines of .bashrc'
tail -n 10 ${HOME_DIR}/.bashrc

# Report end.
echo
echo 'ENDING requirements.sh'
echo '----------------------------------------'
echo ''
