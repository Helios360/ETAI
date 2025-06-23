#!/bin/bash

# Installation script for Node.js, npm, and MySQL
# Installation script for Debian-based systems

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# If you're here you're either dev or in trouble xD gl
echo -e "${YELLOW}( ˶°ㅁ°)! This install script has been created for debian systems cause debian better${NC}"

# Function to check if last command succeeded
check_status() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN} $1 completed successfully${NC}"
    else
        echo -e "${RED} $1 failed${NC}"
        echo "Exiting installation..."
        exit 1
    fi
}
echo "⠀⠀⠀⠀⣠⡶⠶⣶⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⣼⢋⣾⠶⣦⡈⠛⢾⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⢸⠇⡾⠁⢀⣠⣽⠶⠀⠙⠛⠛⣿⠿⢶⣶⣶⣾⣿⣫⣭⣭⣽⣿⢶⡀⠀⠀⠀⠀⠀⠀⠀⣀⣰⠋⠉⠋⠉⠉⠉⡤⣀⠀⠀⠀⡄"
echo "⠀⠠⡿⢸⣧⡶⠋⠁⠀⠀⠀⠀⠀⢨⢅⠀⠉⠈⠀⠀⢻⣯⡀⠀⠰⢸⢻⡇⠀⠀⠀⠀⠀⠀⠀⣻⡿⠥⣟⢢⠀⠊⠀⠀⠈⢛⡶⠀⠁"
echo "⠀⠀⡇⠘⠋⠀⠀⠀⠀⠀⠀⠀⠀⣼⠂⠀⠀⠀⠀⠐⠀⠑⢻⣦⢀⣾⣼⡇⠀⠀⠀⠀⠀⢠⣞⣏⣞⣽⡷⢿⡏⠤⢞⣂⡾⠋⠀⠀⠀"
echo "⠀⣸⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡩⠀⠀⠀⠀⠀⠀⠀⠀⠈⢚⡿⣻⣿⠁⠀⠀⠀⠀⠀⠘⢿⣫⡶⣷⡒⠲⣶⣴⣼⠀⠀⠀⠀⠀⠀"
echo "⢀⣿⢁⡖⠲⢶⣶⣤⣤⣀⠀⠀⠀⣴⡀⢠⣄⣀⣄⣀⣀⣠⣀⢠⢟⣿⠇⠀⠀⠀⠀⠀⠀⠀⣾⣹⣏⠓⠟⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠈⣟⠸⣧⠀⠘⠿⠟⠀⢨⡗⢀⣀⡻⡍⣿⠉⢩⣟⡿⠉⠙⢹⣃⡈⢹⣴⠶⣶⣦⣤⣀⡀⠀⠹⣟⣿⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⣿⡄⠙⠷⠤⣤⡤⠴⠋⠀⠻⠿⠟⢻⣻⣆⡀⠀⠀⠀⣠⡟⢍⢺⢹⡝⠀⠀⠈⠉⠩⢿⣦⡀⠙⢿⣿⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠐⠻⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠿⣿⣿⣿⠭⠾⠛⣱⡿⡇⠀⠀⠀⠁⠀⠈⠫⣿⡄⢀⢻⣏⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠈⠙⠶⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣴⣿⣿⠄⠣⠀⠀⠀⠀⠀⠀⠈⢇⣿⣑⣼⣳⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⢿⢨⣿⡿⣿⣻⣿⣿⣿⣿⣷⣿⡟⢛⣫⣤⣭⣽⣿⠵⣸⢾⣼⠀⠀⠀⠀⠀⢸⣿⣯⣷⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⣠⣤⣌⣼⣿⣿⠀⠀⠀⢁⠼⣩⣿⣿⣥⠿⣟⢻⠈⠙⡼⣷⢠⣿⡁⡄⠀⠀⠀⠀⠠⣯⣿⠋⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⣴⣾⢛⠛⢿⣗⣻⣷⣍⣿⣯⡿⢿⣿⡫⢛⠫⢻⣎⢨⠌⡳⣧⣿⢟⢛⡻⢿⣭⣟⣚⣞⣫⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⡀⠙⠷⠿⠤⠾⠷⠿⠓⠛⢿⣑⣠⡆⠈⣿⠠⠈⢠⣿⣮⣿⣿⠟⡻⠾⠞⠶⠤⠤⠼⠿⣿⡶⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⠍⠉⠉⠉⠙⠛⠛⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"

# Check if script is ran as root
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${RED}This script must be run as root or with sudo privileges${NC}"
    exit 1
fi

# Update and upgrade system packages
echo -e "\n${YELLOW}====(づ ᴗ _ᴗ)づ Updating System Packages ====${NC}"
apt update && apt upgrade -y
check_status "System update"

# Install required packages
echo -e "\n${YELLOW}====(づ ᴗ _ᴗ)づ Installing Required Packages ====${NC}"
wget https://dev.mysql.com/get/mysql-apt-config_0.8.29-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.29-1_all.deb
sudo rm mysql-apt-config_*.deb
apt install nodejs npm mysql-server curl -y
check_status "Package installation"

# Check installed versions
echo -e "\n${YELLOW}====(づ ᴗ _ᴗ)づ Checking Installed Versions ====${NC}"
NODE_VERSION=$(node -v)
NPM_VERSION=$(npm -v)
MYSQL_VERSION=$(mysql -V | awk '{print $5}' | sed 's/,//')

echo -e "Node.js: ${GREEN}$NODE_VERSION${NC}"
echo -e "NPM: ${GREEN}$NPM_VERSION${NC}"
echo -e "MySQL: ${GREEN}$MYSQL_VERSION${NC}"

# Check and start MySQL service
echo -e "\n${YELLOW}====(づ ᴗ _ᴗ)づ Checking MySQL Service ====${NC}"
if systemctl is-active --quiet mysql; then
    echo -e "${GREEN}MySQL is active and running!${NC}"
else
    echo -e "${YELLOW}MySQL is NOT active. Attempting to start...${NC}"
    systemctl start mysql

    if systemctl is-active --quiet mysql; then
        echo -e "${GREEN}MySQL successfully started!${NC}"
    else
        echo -e "${RED}Failed to start MySQL. Please check the service manually.${NC}"
        exit 1
    fi
fi

# Secure MySQL installation
echo -e "\n${YELLOW}====(づ ᴗ _ᴗ)づ Securing MySQL Installation ====${NC}"
echo -e "${YELLOW}Would you like to run mysql_secure_installation utility? (y/n)${NC}"
read -r secure_mysql

if [[ "$secure_mysql" =~ ^[Yy]$ ]]; then
    mysql_secure_installation
    check_status "MySQL secure installation"
else
    echo -e "${YELLOW}Skipping MySQL secure installation${NC}"
fi

# Create a database and user
echo -e "\n${YELLOW}====(づ ᴗ _ᴗ)づ Setting up Database ====${NC}"
echo -e "${YELLOW}Would you like to create a new database? (y/n)${NC}"
read -r create_db

if [[ "$create_db" =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Enter database name:${NC}"
    read -r db_name
    echo -e "${YELLOW}Enter database user:${NC}"
    read -r db_user
    echo -e "${YELLOW}Enter password for the user:${NC}"
    read -r root_password
    echo ""
    # Create database and user
    mysql -u root -p"${root_password}" -e "CREATE DATABASE IF NOT EXISTS \`${db_name}\`;"
    mysql -u root -p"${root_password}" -e "CREATE USER IF NOT EXISTS '${db_user}'@'localhost' IDENTIFIED BY '${db_password}';"
    mysql -u root -p"${root_password}" -e "GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO '${db_user}'@'localhost';"
    mysql -u root -p"${root_password}" -e "FLUSH PRIVILEGES;"


    check_status "Database and user creation"

    # Create .env file for database credentials
    echo -e "\n${YELLOW}Creating .env file with database credentials${NC}"
    cat > .env << EOF
# Database Configuration
DB_HOST=localhost
DB_USER=${db_user}
DB_PASSWORD=${db_password}
DB_NAME=${db_name}

# Node.js Configuration
NODE_ENV=development
PORT=3000
EOF
    check_status "Environment file creation"
else
    echo -e "${YELLOW}Skipping database creation${NC}"
fi

# Firewall configuration
echo -e "\n${YELLOW}====(づ ᴗ _ᴗ)づ Configuring Firewall ====${NC}"
echo -e "${YELLOW}Would you like to configure firewall for web server? (y/n)${NC}"
read -r config_firewall

if [[ "$config_firewall" =~ ^[Yy]$ ]]; then
    # Check if ufw is installed
    if ! command -v ufw &> /dev/null; then
        apt install ufw -y
        check_status "UFW installation"
    fi
    
    # Configure firewall
    ufw allow ssh
    ufw allow 80/tcp
    ufw allow 443/tcp
    ufw allow 3000/tcp
    
    # Enable firewall
    echo -e "${YELLOW}Enable firewall now? This may disconnect your SSH session if not properly configured. (y/n)${NC}"
    read -r enable_fw
    if [[ "$enable_fw" =~ ^[Yy]$ ]]; then
        echo "y" | ufw enable
        check_status "Firewall configuration"
    else
        echo -e "${YELLOW}Firewall rules added but not enabled. Enable manually with 'ufw enable'${NC}"
    fi
else
    echo -e "${YELLOW}Skipping firewall configuration${NC}"
fi

# Create a simple backup script
echo -e "\n${YELLOW}====(づ ᴗ _ᴗ)づ Creating Simple Database Backup Script ====${NC}"
echo -e "${YELLOW}Would you like to create a database backup script? (y/n)${NC}"
read -r create_backup

if [[ "$create_backup" =~ ^[Yy]$ ]]; then
    # Create backup directory
    mkdir -p /var/backups/mysql
    
    # Create a simple backup script
    cat > /usr/local/bin/backup-mysql.sh << EOF
#!/bin/bash
# Simple MySQL database backup script

# Create backup directory
BACKUP_DIR="/var/backups/mysql"
DATE=\$(date +%Y-%m-%d_%H-%M-%S)
mkdir -p \$BACKUP_DIR

# Set credentials - you might need to edit these
DB_USER="${db_user:-root}"
DB_PASS="${db_password:-""}"

# Get all databases except system ones
DATABASES=\$(mysql -u \$DB_USER -p\$DB_PASS -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|mysql|sys)")

# Back up each database to a separate file
echo "Starting backup process..."
for DB in \$DATABASES; do
    echo "Backing up \$DB database..."
    mysqldump -u \$DB_USER -p\$DB_PASS \$DB > \$BACKUP_DIR/\$DB-\$DATE.sql
    if [ \$? -eq 0 ]; then
        echo "✓ \$DB backup successful"
    else
        echo "✗ \$DB backup failed"
    fi
done

echo "Backup completed! Files saved to \$BACKUP_DIR"
echo "To restore a backup: mysql -u [user] -p [database] < [backup_file].sql"
EOF
    
    # Make backup script executable
    chmod +x /usr/local/bin/backup-mysql.sh
    check_status "Backup script creation"
    
    echo -e "${GREEN}Backup script created at /usr/local/bin/backup-mysql.sh${NC}"
    echo -e "${YELLOW}You can run it manually with: ${NC}sudo /usr/local/bin/backup-mysql.sh"
else
    echo -e "${YELLOW}Skipping backup script creation${NC}"
fi

# Installation complete
echo -e "\n${GREEN}====(づ ᴗ _ᴗ)づ INSTALLATION IS DONE !!! :D ====${NC}"
echo -e "${YELLOW}Your system is now configured with:${NC}"
echo -e "- Node.js: ${GREEN}$NODE_VERSION${NC}"
echo -e "- NPM: ${GREEN}$NPM_VERSION${NC}"
echo -e "- MySQL: ${GREEN}$MYSQL_VERSION${NC}"

echo -e "\n${GREEN}Happy coding! (⌐■_■)${NC}"
