output = Build/KulkarNIX.bin

#This is the default option
debug:clean all
	qemu-system-x86_64 -s -S -drive file=$(output),media=disk,format=raw

release:clean all
	qemu-system-x86_64 -cdrom Build/KulkarNIX.iso
	qemu-system-x86_64 -drive file=$(output),index=0,media=disk,format=raw

build:clean all

all: kernel WriteImage

FirstStage:
	$(MAKE) -C Bootloader/FirstStage
SecondStage:
	$(MAKE) -C Bootloader/SecondStage
kernel:
	$(MAKE) -C Kernel/

WriteImage:
	$(MAKE) -C Build/ 


clean:
	$(MAKE) -C Build/ clean
	$(MAKE) -C Kernel/ clean
	$(MAKE) -C Bootloader/FirstStage clean
	$(MAKE) -C Bootloader/SecondStage clean

