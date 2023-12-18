# (hyprland colors must be described without the hash)
def remove_hash_from_hex_color(hex_color):
    if hex_color.startswith("#"):
        return hex_color[1:]
    else:
        return hex_color

# Export 
class FilterModule(object):
    def filters(self):
        return {'remove_hash_from_hex_color': remove_hash_from_hex_color}
