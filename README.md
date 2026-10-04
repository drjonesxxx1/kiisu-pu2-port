# Project Lyra — PU2 Bypass Port for Kiisu v4br Clone Boards

Unleashed Private 2.0 (community bypass build) flashed and verified working on
a Kiisu v4br Flipper Zero clone board.

## Why this exists

The seller's Private Unleashed 2.0 firmware runs a factory-key enclave check
(`furi_hal_crypto_enclave_verify`) that only passes on genuine Flipper boards.
Clone boards (Kiisu v4br, cstm_names_uids bootloader) have no factory keys, so
the device boots with:

    "No Factory Keys Found / Secure Enclave is damaged. Some apps will not work."

This bypass build (from the community "fully unlocked" repackage) ships the
same PU2 experience with the enclave gate non-blocking — the version the clone
community actually runs.

## Contents

| File | Purpose |
|---|---|
| `firmware_bypass_pls.dfu` | Core1 firmware — enclave-bypassed PU2 build |
| `key.fz` | Matching SubGHz keystore — SD card ROOT |
| `keeloq_mfcodes` | Keeloq master codes — `subghz/assets/` |
| `setting_user.txt` | SubGHz user settings — `subghz/assets/` |
| `Vehicles/` | 84-brand rolling-code capture pack — `subghz/Vehicles/` |
| `install.sh` | dfu-util one-shot flasher |
| `00-START-HERE.txt` | Full runbook + recovery |

## Flash (one command)

    ./install.sh firmware_bypass_pls.dfu

Put the device in DFU first: hold **LEFT + BACK** 5s, release **BACK** only.

## SD card (must be FAT32 — the Flipper cannot mount ExFAT)

    key.fz            -> card root
    keeloq_mfcodes    -> subghz/assets/
    setting_user.txt  -> subghz/assets/
    Vehicles/         -> subghz/Vehicles/

## Verify

Device boots without the enclave popup. Sub-GHz -> Add Manually -> protocol
list should show the full PU2 protocol set.

## Credits & sources

- Bypass build + key kit: community "fully unlocked Private-Unleashed-v2.0"
  repackage (public mirrors: shuka0158, iwheeliemycbr, Azayzel)
- Base firmware: DarkFlippers unleashed-firmware
- Vehicle capture pack: PU2 Update release (public mirrors)

For research and educational use on devices and vehicles you own.
