MW='/var/www/localhost/htdocs/w'

# Edit this mw shell script with nano
function nmw {
	nano ~/Shell/mw.sh
}

# Edit this mw script with Atom
function amw {
	atom ~/Shell/mw.sh
}

# Run the update PHP script
function mwupdate {
	pushd $MW
	php maintenance/update.php
	popd
}

# Edit LocalSettings with Atom
function edls {
	pushd $MW
	atom LocalSettings.php
	popd
}

# Save a xzipped MySQL dump of Wiki to ~/Dropbox
function dmysqlz {
	pushd ~/Dropbox
	mysqldump -u root -p Linux_Wiki | xz > dump.sql.xz
	popd
}

# LZMA zip MySQL dump
function dmysqll {
	pushd ~/Dropbox
	mysqldump -u root -p Linux_Wiki | lzma > dump.sql.lzma
	popd
}

# 7z zip MySQL dump
function dmysql7 {
	pushd ~/Dropbox
	mysqldump -u root Linux_Wiki | 7z a -si dump.sql.7z
	popd
}
