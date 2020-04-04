WriteOAMDMACodeToHRAM::
	ld c, LOW(hTransferVirtualOAM)
	ld b, hTransferVirtualOAMEnd - hTransferVirtualOAM
	ld hl, OAMDMACode
.loop
	ld a, [hli]
	ldh [c], a
	inc c
	dec b
	jr nz, .loop
	ret

OAMDMACode:
LOAD "hTransferVirtualOAM", HRAM
hTransferVirtualOAM:: ; ff80
	ld a, HIGH(wVirtualOAM)
	ldh [rDMA], a
	ld a, NUM_SPRITE_OAM_STRUCTS
.pushoam_loop
	dec a
	jr nz, .pushoam_loop
	ret
hTransferVirtualOAMEnd:: ; ff8a
ENDL
