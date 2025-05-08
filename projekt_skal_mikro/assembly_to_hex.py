def assemble_instruction(instruction, labels, line_number):
    opcodes = {
        "LD": "0",
        "LDI": "1",
        "STR": "2",
        "HALT": "3",
        "ADD": "4",
        "IN": "5",
        "JMP": "6",
        "CMP": "7",
        "BNE": "8",
        "BEQ": "9",
        "MOV": "A"
    }

    # Check if this instruction is a label, it should end with ":"
    if instruction.endswith(':'):
        return 'x"0000",'  # Insert x"0000" for label positions in the hex output

    parts = instruction.split(',')
    parts = [part.strip() for part in parts]
    
    opcode = opcodes.get(parts[0].upper(), None)
    if not opcode:
        raise ValueError(f"Invalid opcode: {parts[0]}")

    if parts[0].upper() == "LDI":
        reg1 = parts[1][1:]  # Extract the register number
        operand = parts[2]
        if operand.isdigit():
            hex_value = f"{opcode}{reg1}{int(operand):02X}"

    elif parts[0].upper() == "CMP" or parts[0].upper() == "ADD" or parts[0].upper() == "LD" or parts[0].upper() == "STR":
        # For instructions with two registers
        reg1 = int(parts[1][1:])  # Extract the first register number
        reg2 = int(parts[2][1:])  # Extract the second register number
        hex_value = f"{opcode}{reg1}{reg2:02X}"  # Ensure two-digit hex formatting (e.g., '00', '01')

    elif parts[0].upper() in ["JMP", "BNE", "BEQ"]:
        # Replace labels with corresponding line number
        label = parts[1].upper()
        if label in labels:
            # If label is found, replace it with the corresponding address (line number)
            hex_value = f"{opcode}00{labels[label]:X}"
        else:
            raise ValueError(f"Label {label} not defined!")

    elif parts[0].upper() == "IN":
        reg1 = parts[1][1:]  # Extract the register number
        hex_value = f"{opcode}{reg1}00"
    
    elif parts[0].upper() == "HALT":
        hex_value = f"{opcode}00"
    else:
        raise ValueError(f"Unsupported instruction format: {instruction}")
    
    hex_value = hex_value[:4].ljust(4, '0')  # Ensure the instruction is 4 characters long
    
    return f'x"{hex_value}",'  # Return hex formatted as x"0000"


def convert_assembly_to_hex(input_file, output_file):
    labels = {}  # Store labels and their corresponding line numbers
    instructions = []  # Store instructions for later processing
    line_number = 0

    # First pass to find labels and store instructions
    with open(input_file, 'r') as infile:
        for line in infile:
            line = line.strip()
            if not line:
                continue
            if ':' in line:  # This line is a label
                label_name = line[:-1].strip().upper()
                labels[label_name] = line_number  # Store label and its line number
                instructions.append(line)  # Add the label line itself
            else:
                instructions.append(line)  # Add normal instructions
                line_number += 1

    # Second pass to convert assembly code to hex
    hex_output = []
    for line in instructions:
        try:
            hex_code = assemble_instruction(line, labels, line_number)
            hex_output.append(hex_code)
        except ValueError as e:
            print(f"Error processing line: {line}. Error: {e}")
            continue

    # Ensure the output is exactly 240 lines long
    while len(hex_output) < 240:
        hex_output.append('x"0000",')  # Padding with x"0000"

    # Write the output to the file
    with open(output_file, 'w') as outfile:
        for line in hex_output[:240]:  # Ensure we only write 240 lines
            outfile.write(line + "\n")


input_filename = "assembly_code.txt"
output_filename = "hex_output.txt"
convert_assembly_to_hex(input_filename, output_filename)
