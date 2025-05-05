def assemble_instruction(instruction):
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
        "BEQ": "9"
    }

    parts = instruction.split(',')
    parts = [part.strip() for part in parts]
    
    opcode = opcodes.get(parts[0].upper(), None)
    if not opcode:
        raise ValueError(f"Invalid opcode: {parts[0]}")

    if parts[0].upper() == "LDI":
        reg1 = parts[1][1:]
        operand = parts[2]
        if operand.isdigit():
            hex_value = f"{opcode}{reg1}{int(operand):X}"

    elif parts[0].upper() == "CMP" or parts[0].upper() == "ADD" or parts[0].upper() == "LD" or parts[0].upper() == "STR":
        reg1 = parts[1][1:]
        reg2 = parts[2][1:]
        hex_value = f"{opcode}{reg1}{reg2}"

    elif parts[0].upper() in ["JMP", "BNE", "BEQ"]:
        hex_value = f"{opcode}00{int(parts[1]):X}"

    elif parts[0].upper() == "IN":
        reg1 = parts[1][1:]
        hex_value = f"{opcode}{reg1}00"
    
    elif parts[0].upper() == "HALT":
        hex_value = f"{opcode}00"
    else:
        raise ValueError(f"Unsupported instruction format: {instruction}")
    
    hex_value = hex_value[:4].ljust(4, '0')
    
    return hex_value


def convert_assembly_to_hex(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line in infile:
            line = line.strip()
            if not line:
                continue

            try:
                hex_code = assemble_instruction(line)
                outfile.write(hex_code + "\n")
            except ValueError as e:
                print(f"Error processing line: {line}. Error: {e}")
                continue


input_filename = "assembly_code.txt"
output_filename = "hex_output.txt"
convert_assembly_to_hex(input_filename, output_filename)
