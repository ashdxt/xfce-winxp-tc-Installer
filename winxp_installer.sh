github_link="https://github.com/rozniak/xfce-winxp-tc"
OUTPUT_DIR="$(pwd)/xptc/deb"

sudo apt update

sudo apt install -y git

git clone $github_link &
clone_pid=$!

sudo apt install -y bash cmake coreutils fakeroot gcc make pkg-config python3 
wait $clone_pid

cd xfce-winxp-tc/packaging
 
sudo apt install -y $(./chkdeps.sh -l | cut -d':' -f2 | tr '\n' ' ')


mkdir -p $OUTPUT_DIR

./buildall.sh -o  $OUTPUT_DIR

cd $OUTPUT_DIR

sudo apt install ./*.deb



