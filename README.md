# SPRAM_LED_Blink_test
A simple LED Blink test from a SPRAM to test the GoWin IDE with Tang Nano 20k

- Makes a Led toggle each second according the roms/led.mem contents
- To keep the Led always Off replace roms/led.mem contents with:
  ```
  ff
  ff
  ```
- To keep the Led always On replace roms/led.mem contents with:
  ```
  00
  00
  ```
