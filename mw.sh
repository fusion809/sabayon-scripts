MW='/var/www/localhost/htdocs/w'

function nmw {
	nano ~/Shell/mw.sh
}

function mwupdate {
	pushd $MW
	php maintenance/update.php
	popd
}

function edls {
	pushd $MW
	atom LocalSettings.php
	popd
}

function dmysqlz {
	pushd ~/Dropbox
	mysqldump -u root -p Linux_Wiki | xz > dump.sql.xz
	popd
}

function dmysqll {
	pushd ~/Dropbox
	mysqldump -u root -p Linux_Wiki | lzma > dump.sql.lzma
	popd
}

function dmysql7 {
	pushd ~/Dropbox
	mysqldump -u root Linux_Wiki | 7z a -si dump.sql.7z
	popd
}
