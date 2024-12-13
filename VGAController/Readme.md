Hardware of a simple Video Graphics Array or VGA Controller for a resolution of 640x480 pixels. The hardware is written in Verilog, meanwhile the Implementation is done on Quartus Prime Software!

The design comprised:

Clock Divider ⏲️: Generates a 25 MHz clock signal from the input clock (e.g., 100 MHz) to drive the rest of the VGA system to match the pixel clock rate.
Horizontal Counter 📐: Generates the horizontal pixel count for each line, and enable the vertical controller when a horizontal line is completed.
Vertical Counter 📏: Counts vertical lines when triggered by horizontal controller & resets after completing the total vertical line count.
Synchronizer 🔄: Creates signals for horizontal and vertical synchronization. Determines whether the current pixel location is within the visible region.
Pixel Generator 🎨: Produces RGB color signals for the screen, such as black borders or different color regions, depending on pixel location based on the current pixel coordinates provided by the Synchronizer.
