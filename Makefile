run:
	$(eval NAME := $(shell cat .name))
	$(eval ipfs_staging := $(shell cat .ipfs_staging))
	$(eval ipfs_data := $(shell cat .ipfs_data))
	docker run -d \
	  --name ${NAME} \
	  --cidfile .cid \
	  -v ${ipfs_staging}:/export \
	  -v ${ipfs_data}:/data/ipfs \
	  -p 0.0.0.0:4001:4001 \
	  -p 0.0.0.0:8080:8080 \
	  -p 0.0.0.0:5001:5001 \
	  ipfs/go-ipfs:latest
