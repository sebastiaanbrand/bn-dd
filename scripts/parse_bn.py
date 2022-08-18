from pgmpy.readwrite import XMLBIFReader


if __name__ == '__main__':
    print("hello there")
    reader = XMLBIFReader("data/BN.xmlbif")
    edges = reader.get_edges()
    values = reader.get_values()
    print(values)
