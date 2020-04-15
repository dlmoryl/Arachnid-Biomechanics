# Arachnid-Biomechanics
List of files included:<br />
<br />
1.)Post Process: Inputs hexadecimal file from sensor and outputs in decimal form with graphs<br />
Examples for Post Process Code use: Mar15SS1.txt- data from an experimental run SS1_22g.txt- data from calibrating 3 sensors<br />
<br />
2.)Data Shift: inputs unformatted matrix from Tracker and converts to 64 X frames matrix required for other codes<br />
Examples: none provided<br />
<br />
3.)Spider Moving: Provides short gif of spider walking given a dataset to check for errors visually.<br />
Examples: Mar15_1970.xlsx<br />
<br />
4.)Kinematic data acquisition- provides relevant details on various kinematic properties<br />
Examples: Mar15_1970.xlsx for 4A,4B,4C. COM.xlsx for 4C, Mar15_1970_steps.xlsx for 4C and 4D, pitch.xlsx and yaw.xlsx for 4E<br />
4A.)Angles: Given the aforementioned matrix, returns details on angles between leg segments<br />
4B.)Limb Lengths: Returns length of limbs<br />
4C.)Speed COM: returns information on center of mass, speed over time, and center of mass deviations. Provides gif of the deviations<br />
4D.)Plot Tracks: Plots whether or not the feet were on the ground over time<br />
4E.)Pitch and Yaw: Input 2 excel sheets of pitch and yaw data, and calculate the angles/plot them<br />
4F.)Force: Given leg position information, returns the angles and lengths of the leg segments for static calculations<br />
