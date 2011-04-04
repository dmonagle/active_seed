require "csv"

def seed_csv(modelname, filename)
    data = CSV.read(filename)
    if data.size < 2
        puts "No data found in file " << filename
        return
    end
    header = data[0];
    processed_header = Array.new
    evaluations = Array.new
    statics = Array.new
    header.each do |h|        
    # Check if the header field has an assignment
        if h.include? "="
            c = h.split "="
            h = c[0]        # Replace the header with just the field name
            c.delete_at(0)  # Remove the field name
            evaluation = c.join("=") # Rejoin the rest of the evaluation (if there was another =)
            # If there is no question mark in the evaluation string then we set this column to be
            # static.
            unless evaluation.include? "?"
                statics.push(h + "=" + evaluation)
            else
                processed_header.push(h)
                evaluations.push(evaluation)
            end
        else
            evaluations.push(nil)
            processed_header.push(h)
        end
    end
    header = processed_header
    data.delete_at(0);
    puts "Seeding " + data.size.to_s + " record" + (data.size > 1 ? "s" : "")
    line = 1
    data.each do |d|
        line+=1
        if d.size == header.size
            code = "model = " + modelname + ".new\n"
            for count in 0..(header.size - 1) do
                unless (header[count].strip == "nil")
                    value = d[count]
                    value = "" if value.nil?
                    value = "'" + value.strip.gsub(/'/, "\\\\'") + "'"
                    if evaluations[count].nil?
                        assignment = value
                    else
                        assignment = evaluations[count].split("?")
                        assignment = assignment.join(value)
                    end
                    code += "model." + header[count].strip + "=" + assignment + "\n"
                end
            end
            # Add in the statics
            statics.each do |s|
                code += "model." + s + "\n"
            end
            code += "unless model.save\n"
                code += "print_errors(model.errors, " + line.to_s + ")"
            code += "end\n"
            eval code
            #puts (line - 1).to_s + "/" + data.size.to_s
        else
            puts "Skipping line " + line.to_s + " with mismatch in number of fields (" + d.size.to_s + ")"
        end
    end
    puts " Done"
end

def print_errors(errors, line)
    puts "\nThere were errors on line " + line.to_s
    errors.each do |e|
        puts e.to_s
    end
end