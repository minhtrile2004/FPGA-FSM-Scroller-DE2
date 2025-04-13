# 🔁 FSM-Based LED Scroller on DE2 Cyclone II

This project implements a finite state machine (FSM) that scrolls the word **"FPGA"** across four 7-segment displays on the DE2 Cyclone II FPGA board. The project is written in Verilog and designed to help students understand state transitions, 7-segment encoding, and timing with clock division.

## 📚 Description

- The system cycles through 8 states:
  - Displays letters of "FPGA" scrolling across 7-segment displays.
  - Each state updates every 1 second using a clock divider.
  - The FSM resets when switch `SW[0]` is pressed.

## 🔧 Hardware Used

- **Board**: Altera DE2 Cyclone II FPGA
- **Inputs**:
  - `SW[0]`: Asynchronous reset
- **Outputs**:
  - `HEX0` to `HEX3`: 7-segment display (shows scrolling text)
  - `HEX4` to `HEX7`: Always off (not used)

## 🧠 Key Concepts

- Finite State Machine (FSM)
- Clock Division (to generate 1 Hz clock from 50 MHz)
- 7-Segment Display Encoding
- Sequential Logic with Reset

## 🗂️ Files

| File              | Description                         |
|-------------------|-------------------------------------|
| `fsm_scroller.v`  | Verilog source code for FSM logic   |
| `README.md`       | Project overview and usage guide    |
| `constraints/`    | Pin assignments (QSF)               |
| `docs/`           | diagrams, schematic                 |
  
## 👨‍💻 Author

**Le Minh Tri**  
3rd Year Computer Engineering Student  
📧 minhtri.lmt2004@gmail.com  
🔗 [GitHub Profile](https://github.com/minhtrile2004)

## 📜 License

This project is licensed under the MIT License. Feel free to reuse or build upon it.

---

