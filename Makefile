NAME=Clash.Mini
BINDIR=bin
VERSION=$(shell git describe --tags || echo "unknown version")
BUILDTIME=$(shell date -u)

GOBUILD=CGO_ENABLED=0 go build -trimpath -ldflags '-X "github.com/Dreamacro/clash/constant.BuildTime=$(BUILDTIME)" \
		-X "github.com/Dreamacro/clash/constant.Version=$(VERSION)" \
		-H=windowsgui -w -s -buildid='

WINDOWS_ARCH_LIST = \
	windows-386 \
	windows-amd64

all: windows-amd64 windows-386  # Most used

windows-386:
	GOARCH=386 GOOS=windows $(GOBUILD) -o $(BINDIR)/$(NAME)-$@.exe

windows-amd64:
	GOARCH=amd64 GOOS=windows $(GOBUILD) -o $(BINDIR)/$(NAME)-$@.exe