#include<iostream>
#include<fstream>
#include"bvh_parser.h"

using std::ofstream;
using std::endl;
using std::ostream;

void output_joint(ostream& os,joint root){
    int csize = root.channels.size(),msize = root.motion.size(),jsize = root.children.size();
    os << "\"type\": " << "\"" << root.joint_type << "\"" <<"," << endl;
    os << "\"name\": " << "\"" << root.name << "\"" << "," << endl;
    os << "\"offset\": " << "[" << root.offset_x <<", "<< root.offset_y <<", "<< root.offset_z << "]," << endl;
    os << "\"channels\": " << "[" ;
    for(int i = 0;i < csize;i++){
        os << "\"" << root.channels[i] << "\"";
        if(i != csize - 1)
        os << ", ";
    }
    os << "]," << endl;
    os << "\"motion\": ["<<endl;
    for(int j = 0;j < msize;j++){
        int psize = root.motion[0].size();
        os << "[";
        for(int p = 0;p < psize;p++){
            os << root.motion[j][p];
            if(p != psize - 1) os << ", ";
        }
        if(j != msize - 1) os << "]," << endl;
        else os << "]" << endl;
    }
    os << "]," << endl;
    os << "\"children\": [" << endl;
    for(int j = 0; j < jsize;j++){
        os << "{" << endl;
        output_joint(os,*root.children[j]);
        os << "}" << endl;
        if(j != jsize - 1) os << "," << endl;
        else os << endl;
    }
    os << "]" << endl;
}

void jsonify(joint root, META meta_data) {
    int frames = meta_data.frame;
    double framtime = meta_data.frame_time;
    ofstream outfile;
    outfile.open("output.json");
    outfile << "{" << endl;
    outfile << "\"frame\": " << frames << "," << endl;
    outfile << "\"frame_time\": " << framtime << "," << endl;
    outfile << "\"joint\": " << endl << "{" << endl;
    output_joint(outfile,root);
    outfile << "}" << endl;
    outfile << "}" << endl;
    // output the root and meta_data


    outfile.close();
}