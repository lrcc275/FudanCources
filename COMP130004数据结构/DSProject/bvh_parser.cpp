#include<fstream>
#include"bvh_parser.h"
#include<cmath>
#include<cstdlib>
#include<stack>
#include<list>
#include<algorithm>
#include<iostream>
// a naive bvh parser

using std::ifstream;
using std::ofstream;
using std::string;
using std::stack;
using std::list;
using std::istream;
using std::cout;
using std::endl;
using std::ostream;

void get_motion(const string& s,vector<vector<double>>& q,int pos){
    vector<double> temp;
    int i = 0, size = s.size();
    while (i < size && s[i] == ' ') i++;
    while (i < size) {
        int j = i;
        while (j < size && s[j] != ' ')j++;
        string _s = s.substr(i, j - i + 1);
        double t = atof(_s.c_str());
        temp.push_back(t);
        i = j;
        while (i < size && s[i] == ' ')i++;
    }
    q[pos] = temp;
    return;
}

string get_name(const string& s,int pos){
    while(s[pos] == ' ') pos++;
    int end = pos;
    while(end < s.length() && s[end] != ' ' && s[end] != '\n' && s[end] != '\t' && s[end] != EOF && s[end] != '\r') end++;
    return s.substr(pos,end - pos);
}

void get_offset(const string& s,joint* j){
    int pos = 6;
    int times = 3;
    while(times > 0){
        if (pos >= s.size() || s[pos] == '\t' || s[pos] == '\n' || s[pos] == EOF || s[pos] == '\r')break;
        while (s[pos] == ' ') pos++;
        int end = pos;
        while (end < s.length() &&  s[end] != ' ' && s[end] != '\n' && s[end] != '\t' && s[end] != EOF && s[end] != '\r') end++;
        string e = s.substr(pos, end - pos);
        double off = atof(e.c_str());
        if (times == 3) j->offset_x = off;
        else if (times == 2) j->offset_y = off;
        else j->offset_z = off;
        times--;
        pos = end;
    }
    return;
}

void get_rotation(const string& s,joint* j){
    int pos = 0;
    while(pos < s.size() && s[pos] != EOF && s[pos] != '\t' && s[pos] != '\n' && s[pos] != '\r'){
        if(s[pos] == 'X' || s[pos] == 'Y' || s[pos] == 'Z'){
            string e;
            e.push_back(s[pos]);
            j->channels.push_back(e + "rotation");
        }
        pos++;
    }
    return;
}

void assign_motions(joint& j,vector<vector<double>> t,int& p){
    if(j.joint_type == "ROOT"){
        int lines = t.size();
        for(int line = 0;line != lines;line++){
            j.motion.push_back(vector<double>(6));
            j.motion[line].assign(t[line].begin() + p,t[line].begin() + p + 6);
        }
        p += 6;
        for(int i = 0;i != j.children.size();i++){
            assign_motions(*(j.children[i]),t,p);
        }
    }
    else if(j.joint_type == "JOINT"){
        int lines = t.size();
        for(int line = 0;line != lines;line++){
            j.motion.push_back(vector<double>(3));
            j.motion[line].assign(t[line].begin() + p,t[line].begin() + p + 3);
        }
        p += 3;
        for(int i = 0;i != j.children.size();i++){
            assign_motions(*(j.children[i]),t,p);
        }
    }
    else{
        int lines = t.size();
        for(int line = 0;line != lines;line++){
            j.motion.push_back(vector<double>(0));
        }
        return;
    }
    return;
}

struct node{
    joint jt;
    int deep;
};

int main(int argc, char** argv) {
    joint root;
    META meta_data;
    ifstream file(argv[1]);
    //do something
    string s;
    stack<node> joints;
    stack<joint*> merge;
    node* n;
    joint* j;
    int d = -1,w;
    bool first = true;
    getline(file,s);
    w = 0;
    while(w < s.length() && (s[w] == ' ' || s[w] == '\n' || s[w] == '\t')) w++;
    s = s.substr(w);
    while(1){
        if(s[0] == '{' || s[0] == '}' || s[0] == 'H');
        else if(s[0] == 'M')  break;
        else if(s[0] == 'J'){
            int pos = 5;
            n = new node();
            j = new joint();
            j->joint_type = "JOINT";
            j->name = get_name(s,pos);
            getline(file,s);
            getline(file,s);
            w = 0;
            while(w < s.length() && (s[w] == ' ' || s[w] == '\n' || s[w] == '\t')) w++;
            s = s.substr(w);
            get_offset(s,j);
            getline(file,s);
            w = 0;
            while(w < s.length() && (s[w] == ' ' || s[w] == '\n' || s[w] == '\t')) w++;
            s = s.substr(w);
            get_rotation(s,j);
            d++;
            n->deep = d;
            n->jt = *j;
            joints.push(*n); 
        }
        else if(s[0] == 'E'){
            int pos = 3;
            j = new joint();
            j->joint_type = "End";
            j->name = joints.top().jt.name + "_End";
            joints.top().jt.children.push_back(j);
            getline(file,s);
            getline(file,s);
            w = 0;
            while(w < s.length() && (s[w] == ' ' || s[w] == '\n' || s[w] == '\t')) w++;
            s = s.substr(w);
            get_offset(s,j);
            d--;
            int cnt = -2;
            while(1){
                getline(file,s);
                w = 0;
                while(w < s.length() && (s[w] == ' ' || s[w] == '\n' || s[w] == '\t')) w++;
                s = s.substr(w);
                if(s[0] == '}'){
                    cnt++;
                }
                else break;
            }
            bool f = (cnt > 0);
            if(f) d++;
            while(cnt > 0){
                while(!joints.empty() && joints.top().deep == d){
                    j = new joint();
                    j->channels = joints.top().jt.channels;
                    j->name = joints.top().jt.name;
                    j->joint_type = joints.top().jt.joint_type;
                    j->offset_x = joints.top().jt.offset_x;
                    j->offset_y = joints.top().jt.offset_y;
                    j->offset_z = joints.top().jt.offset_z;
                    j->children = joints.top().jt.children;
                    merge.push(j);
                    joints.pop();
                }
                while(!merge.empty()){
                    if(d != 1) joints.top().jt.children.push_back(merge.top());
                    else root.children.push_back(merge.top());
                    merge.pop();
                }
                d--;
                if(d == 0) break;
                
                cnt--;
            }
            if(f) d--;
            continue;
        }
        else if(s[0] == 'R'){
            int pos = 4;
            n = new node();
            root.joint_type = "ROOT";
            root.name = get_name(s,pos);
            getline(file,s);
            getline(file,s);
            w = 0;
            while(w < s.length() && (s[w] == ' ' || s[w] == '\n' || s[w] == '\t')) w++;
            s = s.substr(w);
            get_offset(s,&root);
            getline(file,s);
            w = 0;
            while(w < s.length() && (s[w] == ' ' || s[w] == '\n' || s[w] == '\t')) w++;
            s = s.substr(w);
            pos = 0;
            int c = 0;
            while(pos < s.size() && s[pos] != EOF && s[pos] != '\t' && s[pos] != '\n' && s[pos] != '\r'){
                if(s[pos] == 'X' || s[pos] == 'Y' || s[pos] == 'Z'){
                    if(c > 2){
                        string e;
                        e.push_back(s[pos]);
                        root.channels.push_back(e + "rotation");
                    }
                    else{
                        string e;
                        e.push_back(s[pos]);
                        root.channels.push_back(e + "position");
                    }  
                    c++;
                }
                pos++;
            }
            d++;
            n->deep = d;
            n->jt = root;
            joints.push(*n); 
        }
        getline(file,s);
        w = 0;
        while(w < s.length() && (s[w] == ' ' || s[w] == '\n' || s[w] == '\t')) w++;
        s = s.substr(w);
        if(!joints.empty()){
            if(joints.top().deep == 0 && !first)
            break;
            else first = false;
        }
    }
    getline(file,s);
    w = 0;
    while(w < s.length() && (s[w] == ' ' || s[w] == '\n' || s[w] == '\t')) w++;
    s = s.substr(w);
    int i = 0;
    int Frames = 0;
    double Framtime = 0;
    while(1){
        if(!(s[i] >= '0' && s[i] <= '9')) i++;
        else{
            int j = i;
            while(s[j] <= '9' && s[j] >= '0') {
                Frames = Frames * 10 + s[j] - '0';
                j++;
            }
            break;
        }
    }
    i = 0;
    getline(file,s);
    w = 0;
    while(w < s.length() && (s[w] == ' ' || s[w] == '\n' || s[w] == '\t')) w++;
    s = s.substr(w);
    while(1){
        if(!(s[i] >= '0' && s[i] <= '9')) i++;
        else{
            int j = i;
            while(s[j] <= '9' && s[j] >= '0' || (s[j] == '.')) j++;
            string _s = s.substr(i,j-i);
            Framtime = atof(_s.c_str());
            break;
        }
    }
    meta_data.frame = Frames;
    meta_data.frame_time = Framtime;
    
    vector<vector<double>> t(Frames);
    for(int i = 0;i != Frames;i++){
        getline(file,s);
        w = 0;
        while(w < s.length() && (s[w] == ' ' || s[w] == '\n' || s[w] == '\t')) w++;
        s = s.substr(w);
        get_motion(s,t,i);
    }
    int p = 0;
    assign_motions(root,t,p);
    jsonify(root, meta_data);
    file.close();
    return 0;
}