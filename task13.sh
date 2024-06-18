#!/bin/bash

# Path ke file skrip Python
python_script="/home/f4hm1/hello.py"

# Path ke file unit systemd
systemd_unit_file="/etc/systemd/system/hello_task13.service"

# Konten file unit systemd
cat <<EOT > "$systemd_unit_file"
[Unit]
Description=Simple Python Script Service

[Service]
ExecStart=/usr/bin/python3 $python_script
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOT

# Memuat ulang daemon systemd untuk mengenali unit baru
systemctl daemon-reload

# Mengaktifkan layanan
systemctl enable hello_task13.service
systemctl start hello_task13.service
systemctl status hello_task13.service
