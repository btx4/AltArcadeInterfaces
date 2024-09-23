PitchPong is an alternative control method for regular Pong. Here is the 1.0 build for pitch pong.


https://github.com/user-attachments/assets/54f6845b-03aa-4a9e-9f10-62d5470ca244

Godot is not built for taking in user voice data. The built in pitch and volume detection is weak and difficult to work with. To get around the limitations, I created "buffers" that are populated by the most recent audio recorded. These buffers hold pitch and decibel data for the audio recorded. By averaging and comparing the values in the buffers, I can determine the average pitch of the sound coming in. Then I apply that to the y position of the paddle.


In the second iteration I wanted to add greater fidelity to the control, meaning more slots for the left paddle to land in. I also wanted to make the game more intuitive and engaging by adding helpful sound effects. I made the new "landing zones" based on the G-major scale. This is optimized for my voice and vocal range, and it is difficult for others to use because of this. In future iterations, I would like to add more range to the paddle landing zones. Perhaps a sort of "wraparound" mechanic, so people with especially low or high voices can play.
