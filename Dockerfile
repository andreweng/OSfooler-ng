FROM ubuntu:20.04

RUN apt update -y && apt upgrade -y && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
apt install -y wget iptables tcpdump python python-setuptools git libpython2.7 libnetfilter-queue1 build-essential python-dev libnetfilter-queue-dev && \
git clone https://github.com/andreweng/OSfooler-ng.git /tmp/ && \
wget http://mirrors.kernel.org/ubuntu/pool/universe/n/nfqueue-bindings/python-nfqueue_0.5-1build2_amd64.deb && \
dpkg -i python-nfqueue_0.5-1build2_amd64.deb && \
cd /tmp/ && \
python setup.py install && \
osfooler-ng -u && \
cp runme.sh / && \
chmod a+x /runme.sh
CMD ["/bin/sh", "/runme.sh"]
